function selectPost(blogPost) {
  console.log('Blog post selected: ', blogPost.title)

  return {
    type: 'BOOK_SELECTED',
    payload: blogPost
  }
}
