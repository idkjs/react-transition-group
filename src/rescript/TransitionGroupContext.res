
// export let x  = React.createContext(Js.Nullable.null);

// type mounting = {isMounting:bool}
// // type t = React.Context.t<Js.Nullable.t<option<string>>>
// // export let default: t = React.createContext(Js.Nullable.null)
// type t = React.Context.t<option<mounting>>
// let context: t= React.createContext(None)
open TransitionState
type dispatch = actions => unit
type contextValue = (state, dispatch)

let initValue: contextValue = (initialState, _ => ignore())

let context = React.createContext(initValue)
let useContext = () => React.useContext(context)
