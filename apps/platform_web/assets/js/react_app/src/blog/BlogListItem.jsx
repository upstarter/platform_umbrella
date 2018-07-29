import React from "react"


const BlogListItem = ({blogPost, onPostSelect}) => {
  if (!blogPost) {
    return <div>Loading...</div>;
  }
  const imageUrl = blogPost.url;

  return (
    <div>
      <li onClick={() => onPostSelect(blogPost)}  className="blog-post-item">
        <div className="blog-list media">
          <div className="media-left">
            <img className="media-object" src={imageUrl} />
          </div>
          <div className="media-body">
            <div className="media-heading">
              {blogPost.title}
            </div>

            <div className=""
          </div>
        </div>
      </li>
    </div>
  )
}

export default BlogListItem;
