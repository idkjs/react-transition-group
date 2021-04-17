let make = React.Context.provider(TransitionGroupContext.context)

let makeProps = (~value, ~children, ()) =>
  {
    "value": value,
    "children": children,
  }
