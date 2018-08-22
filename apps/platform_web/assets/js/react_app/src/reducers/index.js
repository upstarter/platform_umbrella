import { combineReducers } from "redux";
import TokenReducer from "./reducer_tokens";

const rootReducer = combineReducers({
  tokens: TokenReducer
});

export default rootReducer;
