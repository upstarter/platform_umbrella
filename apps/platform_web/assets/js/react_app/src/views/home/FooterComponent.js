import React from "react";
import ReactDOM from "react-dom";
import { Link } from "react-router-dom";
import colors from '../../styles/colors'

export default class FooterComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <div id="footer" style={footerStyles}>
          <p className="copyright">Copyright ©2018, Aion Labs, Inc.</p>
          <Link to="/privacy_policy" className="footer-link">
            Privacy Policy
          </Link>
        </div>
      </React.Fragment>
    );
  }
}

const footerStyles = {
  background: `${colors.darkBlue}`,
  fontSize: "1.2rem",
  textAlign: "center",
  padding: "2rem",
  color: `${colors.white}`,
  '& a': { background: 'none !important' }
}
