// https://stackoverflow.com/questions/53945763/componentdidmount-equivalent-on-a-react-function-hooks-component
// type transitionActions = {
//   appear: option<bool>,
//   enter: option<bool>,
//   exit: option<bool>,
// }
type props = [#enter | #appear]
type transitionStatus = ENTERING | ENTERED | EXITING | EXITED | UNMOUNTED

// type context = React.Context.t<Js.Nullable.t<option<mounting>>>
// let context: React.Context.t<Js.Nullable.t<option<string>>>= React.createContext(Js.Nullable.null)
let isMounting = (state: TransitionState.Config.state) => state.isMounting
let useIsMounting = (state: TransitionState.Config.state) => {
  let (_, dispatch) = TransitionGroupContext.useContext()
  React.useEffect0(() => {
    dispatch(TransitionState.Mounting(state))

    None
  })
}
@react.component
let make = (~children) => {
  let (state, _) = TransitionGroupContext.useContext()
let parentGroup = state
let appear = switch parentGroup {
 | Some(parentGroup) => switch (!parentGroup.isMounting){
  | true => parentGroup.enter
  | false => parentGroup.appear
 }
 | None =>None
}

  children(state)
}
