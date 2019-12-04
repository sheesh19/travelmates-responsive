export const initMultiStep = (selector) => {
  const stepContentEls = document.querySelectorAll('.step-content');
  let activeStep = 0;
  const actionButtonEls = document.querySelectorAll('.step-action .btn');

  const selectStep = (stepNumber) => {
    const currentActiveEl = stepContentEls[activeStep];
    currentActiveEl.classList.remove('step-content-active');

    const newActiveEl = stepContentEls[stepNumber];
    newActiveEl.classList.add('step-content-active');

    activeStep = stepNumber;
  }

  actionButtonEls.forEach((actionButtonEl) => {
    actionButtonEl.addEventListener('click', (e) => {
      e.preventDefault();

      selectStep(activeStep + 1);
    });
  });
};