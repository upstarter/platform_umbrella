function selectPost(blogPost) {
  console.log('Blog post selected: ', blogPost.title)

  return {
    type: 'BLOG_POST_SELECTED',
    payload: blogPost
  }
}
