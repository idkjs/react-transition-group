@module("dom-helpers") external addOneClass:('a,'b )=> unit ="addClass";

@module("dom-helpers") external removeOneClass:('a,'b )=> unit ="removeClass";
let addClass = (node, classes) => switch (node, classes){
 | (Some(node),Some(classes))=>classes->Js.String2.split(" ")->Belt.Array.forEach(c => addOneClass(node, c));
 | _=> ()
}
let removeClass = (node, classes) => switch (node, classes){
 | (Some(node),Some(classes))=>classes->Js.String2.split(" ")->Belt.Array.forEach(c => removeOneClass(node, c));
 | _=> ()
}


