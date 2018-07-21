import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../common/nav/NavContainer"
import { Link } from "react-router-dom"

export default class BlogComponent extends React.Component {

  constructor(props) {
    super(props)
    this.state = { blog_posts: [], isLoading: true, error: null }
  }


  componentDidMount() {
      this.setState({ isLoading: true });

      fetch('/api/v1/blog_posts')
        .then(response => {
          if (response.ok) {
            return response.json();
          } else {
            throw new Error('Something went wrong ...');
          }
        })
        .then(data => this.setState({ blog_posts: data.blog_posts, isLoading: false }))
        .catch(error => this.setState({ error, isLoading: false }));
    }

  render() {
    const { blog_posts, isLoading, error } = this.state;

    if (error) {
      return <p>{error.message}</p>;
    }

    if (isLoading) {
      return (
        <React.Fragment>
          <section id="blog-content" className="is-loading">Loading ...</section>
        </React.Fragment>
      )
    }

    return (
      <React.Fragment>
        <section id="blog-content">
          <div className="blog-posts">
              {blog_posts.map(post =>
                <div key={post.toString()} className="card">
                  <div className="card-content">
                    <div className="content" dangerouslySetInnerHTML={{__html: post.content}}>
                    </div>
                  </div>
                </div>
              )}
          </div>
        </section>
      </React.Fragment>
    )
  }
}
