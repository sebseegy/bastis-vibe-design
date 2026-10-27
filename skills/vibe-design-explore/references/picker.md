# Variant picker (standalone HTML)

Adapted from Emil Kowalski's `prototype/PICKER.md` (MIT). The picker is chrome, not a design
decision: copy it as is; only variant names and count change.

```html
<nav class="proto-picker" aria-label="Prototype variants">
  <span class="proto-picker-highlight" aria-hidden="true"></span>
  <!-- one button per variant -->
  <button class="proto-picker-item" data-active aria-current="true">Quiet</button>
  <button class="proto-picker-item">Briefing</button>
  <button class="proto-picker-item">Board</button>
</nav>
<main id="stage"></main>
```

```css
.proto-picker{position:fixed;bottom:24px;left:50%;transform:translateX(-50%);z-index:2147483647;
 display:flex;align-items:center;gap:2px;padding:4px;border-radius:999px;background:rgba(10,10,10,.82);
 -webkit-backdrop-filter:blur(12px) saturate(1.4);backdrop-filter:blur(12px) saturate(1.4);
 box-shadow:0 0 0 1px rgba(255,255,255,.08) inset,0 8px 24px rgba(0,0,0,.24),0 2px 6px rgba(0,0,0,.12);
 font:13px/1 -apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;user-select:none;-webkit-user-select:none}
.proto-picker-highlight{position:absolute;top:4px;left:0;height:28px;border-radius:999px;background:rgba(255,255,255,.12)}
.proto-picker[data-ready] .proto-picker-highlight{transition:transform 250ms cubic-bezier(.23,1,.32,1),width 250ms cubic-bezier(.23,1,.32,1)}
@media (prefers-reduced-motion:reduce){.proto-picker[data-ready] .proto-picker-highlight{transition:none}}
.proto-picker-item{position:relative;display:flex;align-items:center;height:28px;padding:0 12px;border:0;border-radius:999px;
 background:transparent;color:rgba(255,255,255,.55);font:inherit;cursor:pointer;transition:color 150ms ease-out}
.proto-picker-item:hover{color:rgba(255,255,255,.85)}
.proto-picker-item:active{transform:scale(.97)}
.proto-picker-item:focus-visible{outline:2px solid rgba(255,255,255,.4);outline-offset:2px}
.proto-picker-item[data-active]{color:#fff}
.proto-picker[data-position="top"]{bottom:auto;top:24px}
```

```js
// variants = array of functions returning HTML strings, in picker order
const stage=document.getElementById('stage'),picker=document.querySelector('.proto-picker'),
 hl=picker.querySelector('.proto-picker-highlight'),items=[...picker.querySelectorAll('.proto-picker-item')];
let cur=0;
function move(){const el=items[cur];hl.style.width=el.offsetWidth+'px';hl.style.transform=`translateX(${el.offsetLeft}px)`}
function mount(i){stage.innerHTML='';requestAnimationFrame(()=>{stage.innerHTML=variants[i]()})}
function set(i){if(i<0||i>=variants.length)return;cur=i;items.forEach((el,j)=>{el.toggleAttribute('data-active',j===i);
 j===i?el.setAttribute('aria-current','true'):el.removeAttribute('aria-current')});move();
 const u=new URL(location);u.searchParams.set('v',i+1);history.replaceState(null,'',u);mount(i)}
items.forEach((el,i)=>el.addEventListener('click',()=>set(i)));addEventListener('resize',move);
addEventListener('keydown',e=>{if(/^(INPUT|TEXTAREA|SELECT)$/.test(e.target.tagName)||e.target.isContentEditable||e.metaKey||e.ctrlKey||e.altKey)return;
 const n=parseInt(e.key,10);if(n>=1&&n<=variants.length)set(n-1);
 else if(e.key==='ArrowRight')set((cur+1)%variants.length);else if(e.key==='ArrowLeft')set((cur-1+variants.length)%variants.length);
 else if(e.key.toLowerCase()==='r')mount(cur)});
set((parseInt(new URLSearchParams(location.search).get('v'),10)||1)-1);
requestAnimationFrame(()=>requestAnimationFrame(()=>picker.setAttribute('data-ready','')));
```

Behaviour: keys 1–N and ←/→ switch, R replays; switching is instant (no animation on the variant);
selection persists in `?v=`. If a variant sits at the bottom centre, set `data-position="top"`.
