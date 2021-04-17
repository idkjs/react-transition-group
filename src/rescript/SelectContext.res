let setSelectionContext: React.Context.t<option<option<string> => unit>> = React.createContext(None)
let selectionContext: React.Context.t<option<string>> = React.createContext(None)
let screenContext: React.Context.t<option<string>> = React.createContext(None)

module ScreenContextProvider = {
  let makeProps = (~value, ~children, ()) =>
    {
      "value": value,
      "children": children,
    }
  let make = React.Context.provider(screenContext)
}

module SetSelectionContextProvider = {
  let makeProps = (~value, ~children, ()) =>
    {
      "value": value,
      "children": children,
    }
  let make = React.Context.provider(setSelectionContext)
}
module SelectionContextProvider = {
  let makeProps = (~value, ~children, ()) =>
    {
      "value": value,
      "children": children,
    }
  let make = React.Context.provider(selectionContext)
}

@react.component
export make = (~componentId, ~children) => {
  let (selection, setSelection) = React.useState(() => None)
  let setSelection = newSelection => {
    setSelection(_ => {
      newSelection
    })
  }

  <ScreenContextProvider value={Some(componentId)}>
    <SetSelectionContextProvider value={Some(setSelection)}>
      <SelectionContextProvider value={selection}> children </SelectionContextProvider>
    </SetSelectionContextProvider>
  </ScreenContextProvider>
}
let noopPressed = _ => false
let noopSetPressed = (_, _) => ()

// let use = () => {
//   let selection = React.useContext(selectionContext)
//   let setSelection = React.useContext(setSelectionContext)
//   let componentId = React.useContext(screenContext)

//   Navigation.useDidAppear(componentId->Belt.Option.getWithDefault(""), () => {
//     switch setSelection {
//     | None => ()
//     | Some(setSelection) => setSelection(None)
//     }
//   })

//   let isPressed = item => selection == Some(item)

//   (
//     isPressed,
//     switch setSelection {
//     | Some(setSelection) =>
//       (item, isPressed) => isPressed ? setSelection(Some(item)) : setSelection(None)
//     | None => (_, _) => ()
//     },
//   )
// }
