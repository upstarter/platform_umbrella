import React from 'react'
import ReactDOM from 'react-dom'
import NavContainer from "../../components/nav/NavContainer"
import { Link } from "react-router-dom"
import {url} from '../../utils/consts'

export default class BlogComponent extends React.Component {

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

    if (error) {
      return <p>{error.message}</p>;
    }

    if (isLoading) {
      return (
        <React.Fragment>
          <section id="blog" className="dark-wrap">
            <div className="card is-loading">
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
        <section id="blog" className="dark-wrap">
          <div className="section-heading">
            <h1>Blog Posts</h1>
          </div>
          <div className="blog-posts columns">
              {blogPosts.map(post =>
                <div key={post.link} className="card column">
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
