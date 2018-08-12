import React from "react";

const Step1 = params => {
  if (params.currentStep !== 1) {
    return null;
  }
  return <p>This is step 1</p>;
};

export default Step1;
