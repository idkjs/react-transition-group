// type transitionActions = {
//   appear: option<bool>,
//   enter: option<bool>,
//   exit: option<bool>,
// }
module Config = {
  @deriving(accessors)
  type state = {
    isMounting: bool,
    appear: option<bool>,
    enter: option<bool>,
    exit: option<bool>,
  }
  // type path = list<item>
}
type actions = Mounting(Config.state)

type state = option<Config.state>

let initialState: state = None

let reducer = (_, action: actions) =>
  switch action {
  | Mounting(state) => Some(state)
  }
