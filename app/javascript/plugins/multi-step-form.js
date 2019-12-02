// const stepContentEls = document.querySelectorAll('.step-content');

// if (stepContentEls) {
//   let activeStep = 0;
//   const actionButtonEls = document.querySelectorAll('.step-action .btn');

//   const selectStep = (stepNumber) => {
//     const currentActiveEl = stepContentEls[activeStep];
//     currentActiveEl.classList.remove('step-content-active');

//     const newActiveEl = stepContentEls[stepNumber];
//     newActiveEl.classList.add('step-content-active');

//     activeStep = stepNumber;
//   }

//   actionButtonEls.forEach((actionButtonEl) => {
//     actionButtonEl.addEventListener("click", (event) => {
//       event.preventDefault();

//       selectStep(activeStep + 1);
//     });
//   });
// }


export const initMultiStep = (selector) => {
  const stepContentEls = document.querySelectorAll(selector);
  new MultiStep(stepContentEls);
};

class MultiStep {
  constructor(els) {
    this.els = els;
    this.onButtonClick = this.onButtonClick.bind(this);
    this.init;
  }

  init() {
    let activeStep = 0;
    const actionButtonEls = document.querySelectorAll('.step-action .btn');
 
    const selectStep = (stepNumber) => {
      const currentActiveEl = stepContentEls[activeStep];
      debugger
      currentActiveEl.classList.remove('step-content-active');

      const newActiveEl = stepContentEls[stepNumber];
      newActiveEl.classList.add('step-content-active');

      activeStep = stepNumber;
    }
    
    actionbuttonEls.forEach((actionButtonEl) => {
      actionButtonEl.addEventListener('click', this.onButtonClick);
    }); 
  }

  onButtonClick(e) {
    e.preventDefault();
    selectStep(activeStep + 1);
  }

}