import axios from 'axios';

async function submitForm(e) {
  e.preventDefault();
  const token = document.querySelector("meta[name='csrf-token']").content;
  const result = await axios.post('/predictions_by_round', {
    authenticity_token: token
  })
  console.log(result.data);
}

window.onload = () => {
  const submitButton = document.querySelector("button.submit");
  if (submitButton) submitButton.addEventListener("click", submitForm);
};
