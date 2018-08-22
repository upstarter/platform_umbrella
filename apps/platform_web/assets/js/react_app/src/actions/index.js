import axios from "axios";

// const ROOT_URL = `http://localhost:4000`;

export const FETCH_TOKENS = "FETCH_TOKENS";

// action creator
export default function fetchTokens(term) {
  // const url = `${ROOT_URL}/api/v1/tokens?q=${term}`;
  // const request = axios.get(url);

  return {
    type: FETCH_TOKENS,
    payload: []
  };
}
