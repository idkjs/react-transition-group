type shape2 ={
          enter: string,
          exit: string,
          active: string
        };
type shape3 = {
          enter: string,
          enterDone: string,
          enterActive: string,
          exit: string,
          exitDone: string,
          exitActive: string
        }

type timeOutShape ={
          enter: int,
          exit: int,
          active: int
        };
type classNamesShape = [ | #Shape(string) | #Shape2(shape2) | #Shape3(shape3)]
type classNames = string
type appliedClasses = {
    appear: {},
    enter: {},
    exit: {},
  }
