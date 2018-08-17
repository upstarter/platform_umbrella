import React from "react";
import ReactDOM from "react-dom";
import Button from "../../components/Button/Button";
import Modal from "react-modal";
import SignUpWizard from "../../components/signUpWizard/SignUpWizard";

export default class HeroComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      subscribeButtonLoading: false,
      applyNowButtonLoading: false,
      showModal: false
    };
    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.handleCloseModal = this.handleCloseModal.bind(this);
  }
  componentWillMount() {
    Modal.setAppElement("body");
  }

  handleOpenModal() {
    this.setState({ showModal: true });
  }

  handleCloseModal() {
    this.setState({ showModal: false });
  }
  render() {
    var flags = { userType: "investor" };
    let state = this.state;
    return (
      <section className="heero">
        <Modal
          isOpen={state.showModal}
          // onAfterOpen={this.afterOpenModal}
          onRequestClose={this.handleCloseModal}
          style={modalStyles}
          contentLabel="Example Modal"
        >
          {/* <h2 ref={subtitle => (this.subtitle = subtitle)}>Hello</h2> */}
          {/* <button onClick={this.handleCloseModal}>close</button> */}
          <SignUpWizard />
        </Modal>
        <div className="heero-body column">
          <div className="container">
            <h1 className="title">
              Become a <span className="fancy-underline">top 1%</span> crypto
              investor.
            </h1>
            <p className="subtitle-big">Receive free insights in your inbox.</p>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container has-text-centered">
                  <div id="form-container">
                    <div className="control has-text-centered">
                      <input
                        className="input"
                        type="text"
                        placeholder="Email Address"
                      />
                    </div>
                    <Button
                      className={`is-primary is-rounded ${
                        state.subscribeButtonLoading ? "is-loading" : null
                      }`}
                      onClick={this.handleOpenModal}
                    >
                      {" "}
                      Subscribe{" "}
                    </Button>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </section>
    );
  }
}

const modalStyles = {
  overlay: {
    position: "fixed",
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: "rgba(0, 0, 0, 0.75)"
  },
  content: {
    width: "960px",
    height: "714px",
    margin: "auto auto",
    padding: "0",
    border: "0"
  }
};
