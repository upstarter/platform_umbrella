import React from "react";

const Step3 = params => {
  if (params.currentStep !== 3) {
    return null;
  }
  return <h1>step3</h1>;
};

export default Step3;
