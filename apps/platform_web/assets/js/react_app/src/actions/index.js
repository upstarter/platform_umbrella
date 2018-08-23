import axios from "axios";

const ROOT_URL = `http://localhost:4000`;

export const FETCH_TOKENS = "FETCH_TOKENS";

// action creator
export function fetchTokens(term) {
  const url = `${ROOT_URL}/api/v1/search?q=${term}`;
  const request = axios.get(url);

  console.log('Action Received: ', request);
  return {
    type: FETCH_TOKENS,
    payload: request
  };
}
