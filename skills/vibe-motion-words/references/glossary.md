# Motion glossary

From Emil Kowalski's `animation-vocabulary` (MIT). ⚠ = discouraged in Vibe app screens (C3/C4);
fine to name, not to request without a reason.

## Entrances & exits
- **Fade in / Fade out** — Element appears or disappears by changing opacity.
- **Slide in** — Element enters by sliding in from off-screen (left, right, top, or bottom).
- **Scale in** — Element grows from smaller to full size as it appears, often paired with a fade.
- **Pop in** — Element appears with a slight overshoot, like it bounces into place. ⚠
- **Reveal** — Content is uncovered gradually, often by animating a clip-path or mask.
- **Enter / Exit** — The animation an element plays when it's added to or removed from the screen.

## Sequencing & timing
- **Keyframes** — Defined points in an animation (0%, 50%, 100%) that the browser fills the gaps between.
- **Interpolation / Tween** — Generating all the in-between frames between a start and end value, so motion is continuous.
- **Stagger** — Animate several items one after another with a small delay between each, creating a cascade.
- **Orchestration** — Deliberately timing multiple animations so they feel like one coordinated motion.
- **Delay** — Time before an animation starts.
- **Duration** — How long an animation takes.
- **Fill mode** — Whether an element keeps its first or last frame's styles before the animation starts or after it ends (e.g. forwards).
- **Stepped animation** — An animation that is divided into discrete steps, like a countdown timer.

## Movement & transforms
- **Translate** — Move an element along the X or Y axis.
- **Scale** — Make an element bigger or smaller.
- **Rotate** — Spin an element around a point.
- **Skew** — Slant an element along the X or Y axis, shearing it out of its rectangular shape. ⚠
- **3D tilt / Flip** — Rotate in 3D space (rotateX / rotateY) to add depth. ⚠
- **Perspective** — How strong the 3D effect looks — a lower value exaggerates depth. ⚠
- **Transform origin** — The anchor point a scale or rotation grows or spins from.
- **Origin-aware animation** — An element animates out of its trigger, like a popover growing from the button that opened it instead of from its own center.

## Transitions between states
- **Crossfade** — One element fades out as another fades in, in the same spot.
- **Continuity transition** — A change that keeps the user oriented by visually connecting before and after.
- **Morph** — One shape smoothly turns into another shape, e.g. Dynamic Island. ⚠
- **Shared element transition** — An element travels and transforms from one position into another, like a thumbnail expanding into a card. ⚠
- **Layout animation** — When an element's size or position changes, it animates to the new spot instead of snapping.
- **Accordion / Collapse** — A section smoothly expands and collapses its height to show or hide content.
- **Direction-aware transition** — Content slides one way going forward and the opposite way going back.

## Scroll
- **Scroll reveal** — Elements fade or slide into place as they enter the viewport. ⚠ (public pages only)
- **Scroll-driven animation** — An animation whose progress is tied directly to scroll position. ⚠
- **Parallax** — Background and foreground move at different speeds while scrolling. ⚠
- **Page transition** — An animation that plays when navigating from one page or route to another.
- **View transition** — The browser morphs between two states or pages, connecting shared elements. ⚠

## Feedback & interaction
- **Hover effect** — Visual change when the cursor moves over an element.
- **Press / Tap feedback** — A subtle scale-down when an element is clicked, so it feels physical.
- **Hold to confirm** — A progress effect that fills up while the user holds a button.
- **Drag** — Moving an element by grabbing it, often with momentum when released. ⚠
- **Drag to reorder** — Dragging items in a list to rearrange them, while the others shift to make room. ⚠
- **Swipe to dismiss** — Dragging an element off-screen to close it, like a drawer or toast. ⚠
- **Rubber-banding** — Resistance and snap-back when you drag past a boundary. ⚠
- **Shake / Wiggle** — A quick side-to-side jitter signaling an error or rejected input.
- **Ripple** — A circle expanding from the point of a tap, confirming the press.

## Easing
- **Easing** — The rate at which an animation speeds up or slows down.
- **Ease-out** — Starts fast, ends slow. The default for most UI.
- **Ease-in** — Starts slow, ends fast. Usually avoided; can feel sluggish.
- **Ease-in-out** — Slow, fast, slow. Good for elements already on screen moving from A to B.
- **Linear** — Constant speed. Reserve for spinners or marquees.
- **Cubic-bezier** — A custom easing curve you define for precise control.
- **Asymmetric easing** — A curve that accelerates and decelerates at different rates.

## Springs ⚠ (all — physics needs a library Vibe may not use)
- **Spring** — Motion driven by physics (tension, mass, damping) rather than a set duration.
- **Stiffness / Tension** — How strongly the spring pulls toward its target.
- **Damping** — How quickly a spring settles. Lower damping means more bounce.
- **Mass** — How heavy the animated element feels.
- **Bounce** — A spring that overshoots and settles.
- **Perceptual duration** — How long a spring feels finished, even though it keeps micro-settling.
- **Momentum** — Motion that carries velocity, especially after a drag or interruption.
- **Velocity** — How fast and in which direction an element is moving.
- **Interruptible animation** — An animation that can be smoothly redirected mid-flight instead of finishing first. (CSS transitions give this too ✓)

## Looping & ambient ⚠ (all, except progress indicators)
- **Marquee** — Content that scrolls continuously in a loop.
- **Loop** — An animation that repeats.
- **Alternate (yoyo)** — A loop that plays forward then reverses.
- **Orbit** — An element circling around another.
- **Pulse** — A gentle repeating scale or opacity change to draw attention.
- **Float** — A gentle, continuous up-and-down drift.
- **Idle animation** — Subtle motion while an element waits to be used.

## Polish & effects
- **Blur** — A blur filter used to soften an element or mask imperfections. ⚠
- **Clip-path** — Clipping an element to a shape, for reveals, masks, before/after sliders.
- **Mask** — Like clip-path, but with soft, fadeable edges.
- **Before / after slider** — A draggable divider that wipes between two images. ⚠
- **Line drawing** — An SVG path that draws itself in. ⚠
- **Text morph** — Text that animates character by character when it changes. ⚠
- **Skeleton / Shimmer** — A placeholder shown while content loads. (Vibe house rule: flat grey bars, no shimmer.)
- **Number ticker** — Digits rolling or counting up to a value.
- **Tabular numbers** — Fixed-width digits so numbers don't shift. Essential for tables and counters ✓
- **Typewriter** — Text appearing one character at a time. ⚠

## Performance
- **Frame rate (FPS)** — Frames drawn per second; 60 baseline, 120 on newer displays.
- **Jank** — Visible stutter when frames drop.
- **Dropped frame** — A frame the browser missed its deadline to draw.
- **Compositing** — The GPU moves or fades an element on its own layer.
- **will-change** — A hint that an element is about to animate.
- **Layout thrashing** — Animating width, height, top or left, forcing layout every frame.

## Principles
- **Purposeful animation** — Motion serves a function, not decoration.
- **Anticipation** — A small wind-up before a move. ⚠
- **Follow-through** — Parts keep moving and settle after the main motion. ⚠
- **Squash & stretch** — Deforming an element as it moves. ⚠
- **Perceived performance** — The right animation makes an interface feel faster.
- **Frequency of use** — The more often seen, the shorter and subtler.
- **Spatial consistency** — An element keeps its identity and position across states.
- **Hardware acceleration** — Animating transform and opacity keeps motion smooth.
- **Reduced motion** — Respecting the user's reduced-motion setting.
