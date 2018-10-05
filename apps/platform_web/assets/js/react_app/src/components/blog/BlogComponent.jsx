import React from 'react'
import ReactDOM from 'react-dom'
import NavContainer from "../../components/nav/NavContainer"
import { Link } from "react-router-dom"
import {url} from '../../utils/consts'
import injectSheet, { jss } from "react-jss"
import colors from '../../styles/colors'

class BlogComponent extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      blogPosts: [],
      selectedPost: null,
      isLoading: true,
      error: null
    };
  }


  componentDidMount() {
    console.log(`${url}/api/v1/blog_posts`);

      this.setState({ isLoading: true });

      fetch(`${url}/api/v1/blog_posts`)
        .then(response => {
          if (response.ok) {
            return response.json();
          } else {
            throw new Error('Something went wrong ...');
          }
        })
        .then(data => this.setState({
          blogPosts: data.blog_posts,
          selectedPost: data.blog_posts[0],
          isLoading: false
        }))
        .catch(error => this.setState({ error, isLoading: false }));
  }

  render() {
    const { blogPosts, isLoading, error } = this.state;
    const { classes } = this.props;

    if (error) {
      return <p>{error.message}</p>;
    }

    if (isLoading) {
      return (
        <React.Fragment>
          <section id="blog" className={classes.blog}>
            <div className={classes.card, "is-loading"}>
              <div className="card-content">
                <div className="content"></div>
              </div>
            </div>
          </section>
        </React.Fragment>
      )
    }

    return (
      <React.Fragment>
        <section id="blog" className={classes.blog, 'dark-wrap'}>
          <div className="section-heading">
            <h1>Blog Posts</h1>
          </div>
          <div className={classes.blogPosts}>
              {blogPosts.map(post =>
                <div key={post.link} className={classes.card}>
                  <div className="card-content">
                    <p id="date" className="caption" dangerouslySetInnerHTML={{__html: post.date}}>
                    </p>
                    <div className="content" dangerouslySetInnerHTML={{__html: post.content}}>
                    </div>
                    <a href={post.link} className="link">Read More</a>
                  </div>
                </div>
              )}
          </div>
        </section>
      </React.Fragment>
    )
  }
}
const blogStyles = {
  blog: {
    padding: '6rem 3rem 12rem',
    background: `${colors.darkBlue} !important`,

  },
  blogPosts: {
    display: 'flex',
    flexWrap: 'wrap',
    flexDirection: 'row',
    justifyContent: 'center',
    '@media (min-width: 992px)': {
      width: '60vw',
      margin: '0 auto',
    }
  },
  card: {
    width: '320px',
    margin: '20px,',

    '@media (min-width: 992px)': {
       maxWidth: '60ch'
    },

    '& .is-loading': {
      minHeight: '100vh',

      '&:after': {
        // '@include': 'loader',
        position: 'absolute',
        top: 'calc(25% - 2.5em)',
        left: 'calc(50% - 2.5em)',
        width: '5em',
        height: '5em',
        borderWidth: '0.25em',
      }
    },
    '& h1,& h2,& h3,& h4,& h5,& h6,& strong,& em': { color: 'white' },
    minHeight: '100%',
    '& a strong': { color: 'white' },
    '& a strong em': { color: 'white' },
    '& h2': {
      fontFamily: 'Avenir-Medium',
      fontWeight: 'normal',
      fontSize: '2rem',
      lineHeight: '2.6rem',
      letterSpacing: '0.1ch'
    },
    '& h3': {
      fontFamily: 'Avenir-Light',
      fontWeight: 'normal',
      fontSize: '1.8rem',
      lineHeight: '2.6rem',
      letterSpacing: '0.1ch',
      color: `${colors.white}`,
    },
    '& h4': {
      fontFamily: 'Avenir-Book',
      fontWeight: 'normal',
      fontSize: '1.6rem',
      lineHeight: '2.6rem',
      letterSpacing: '0.1ch',
      color: `${colors.smoke}`,
    },
    '& p': {
      fontFamily: 'Avenir-Book',
      fontWeight: 'light',
      lineHeight: '2rem',
      letterSpacing: '0.1ch',
      fontSize: '1.4rem',
      color: `${colors.smoke}`,
    }
  },
}
export default injectSheet(blogStyles)(BlogComponent)
