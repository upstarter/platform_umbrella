import React from "react";

const Step2 = params => {
  if (params.currentStep !== 2) {
    return null;
  }
  return <h1>step2</h1>;
};

export default Step2;
