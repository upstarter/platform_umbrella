import React from "react"
import BlogListItem from './BlogListItem'

const BlogList = (props) => {

  const blogItems = props.blog_posts.map((blog_post) => {
    return (
      <BlogListItem
        onPostSelect={props.onPostSelect}
        key={blog_post.etag}
        blog_post={blog_post} />
    )
  });

  return (
    <div>
      <ul className="blog-list">
        {blogItems}
      </ul>
    </div>
  )
}

export default BlogList;
