import React from "react";
import ReactDOM from "react-dom";
import Button from "../../components/Button/Button";
import Modal from "react-modal";
import SignUpWizard from "../SignUpWizard/SignUpWizard";
import { url } from "../../utils/consts";
// quiz
import Quiz from "../../components/quiz/Quiz";
import { quiz } from "../../data/analystQuizData";
import injectSheet, { jss } from "react-jss";
import nestedJSS from 'jss-nested'
import heroStyles from '../../styles/heroStyles'

class HeroComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      subscribeButtonLoading: false,
      applyNowButtonLoading: false,
      showModal: false,
      showQuizModal: false
    };
    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.handleCloseModal = this.handleCloseModal.bind(this);
    this.handleOpenQuizModal = this.handleOpenQuizModal.bind(this);
  }
  componentWillMount() {
    Modal.setAppElement("body");
  }
  handleOpenQuizModal() {
    this.setState({ showQuizModal: true });
  }

  handleOpenModal() {
    this.setState({ showModal: true }, () => {
      fetch(`${url}/api/v1/topics`)
        .then(response => {
          if (response.status !== 200) {
            console.log(
              "Looks like there was a problem. Status Code: " + response.status
            );
            return;
          }

          // Examine the text in the response
          response.json().then(data => {
            this.setState({ topics: data.data });
          });
        })
        .catch(err => {
          console.log("Fetch Error :-S", err);
        });
    });
  }

  handleCloseModal() {
    if (!this.state.showModal) {
      this.setState({ showQuizModal: false });
    }
    this.setState({ showModal: false });
  }


  render() {
    var flags = { userType: "investor" };
    let state = this.state;
    const { classes } = this.props;
    return (
      <section className={classes.hero}>
        <Modal
          isOpen={state.showModal}
          // onAfterOpen={this.afterOpenModal}
          onRequestClose={this.handleCloseModal}
          style={modalStyles}
          contentLabel="Example Modal"
        >
          {/* <h2 ref={subtitle => (this.subtitle = subtitle)}>Hello</h2> */}
          {/* <button onClick={this.handleCloseModal}>close</button> */}
          <SignUpWizard topics={this.state.topics} />
        </Modal>
        <Modal
          isOpen={state.showQuizModal}
          // onAfterOpen={this.afterOpenModal}
          onRequestClose={this.handleCloseModal}
          style={modalStyles}
          contentLabel="Example Modal"
        >
          <Quiz quiz={quiz} />
        </Modal>
        <div className='hero-body'>
          <div className="container">
            <h1 className="title">
              Become a <span className="fancy-underline">top 1%</span> crypto
              <div className="slidingVertical">
                <span>investor.</span>
                <span>analyst.</span>
                <span>developer.</span>
                <span>founder.</span>
                <span>trader.</span>
              </div>
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
              <Button
                className={`is-primary is-rounded ${
                  state.subscribeButtonLoading ? "is-loading" : null
                }`}
                onClick={this.handleOpenQuizModal}
              >
                {" "}
                Quiz{" "}
              </Button>
            </div>
          </div>
        </div>
      </section>
    );
  }
}

// Compile styles, apply plugins.
export default injectSheet(heroStyles)(HeroComponent)

const modalStyles = {
  overlay: {
    position: 'fixed',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0, 0, 0, 0.75)'
  },
  content: {
    padding: '0',
    border: '0',
    position: 'absolute',
    top: '80px',
    left: '40px',
    right: '40px',
    bottom: '40px',
    overflow: 'auto',
    WebkitOverflowScrolling: 'touch',
    borderRadius: '4px',
  },
  '@media (max-width: 768px)': {
    content: {
      top: '810px',
      left: '410px',
      right: '40px',
      bottom: '40px',
      overflow: 'auto'
    },
    main: {
      padding: '1em 1em'
    }
  }
};
