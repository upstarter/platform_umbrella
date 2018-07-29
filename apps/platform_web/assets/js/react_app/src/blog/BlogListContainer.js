import React from "react"
import { connect } from "react-redux";

class BlogListContainer extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      blogPosts: [],
      selectedPost: null,
      isLoading: true,
      error: null
    }
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
        .then(data => this.setState({
          blogPosts: data.blogPosts,
          selectedPost: data.blogPosts[0],
          isLoading: false
        }))
        .catch(error => this.setState({ error, isLoading: false }));
    }


  render() {
    return (
      <BlogDetail />
      <BlogList
        onPostSelect={selectedPost => this.setState({selectedPost}) } />
    )
  }
}

function mapStateToProps(state) {
  // whatever is returned will show up as props inside BookList
  return {
    blogPosts: state.blogPosts;
  };
}

// connect takes a function and component and produces a container that is aware
// of state contained by redux
export default connect(mapStateToProps)(BlogListContainer)
