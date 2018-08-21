import { combineReducers } from 'redux';
import BlogPostsReducer from './reducer_blog_posts'

const rootReducer = combineReducers({
  blogPosts: BlogPostsReducer
});

export default rootReducer;
