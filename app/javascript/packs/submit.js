$('.send-comment').on('keypress', e => {
  if (e.keyCode == 13) {
    e.target.form.dispatchEvent(new Event('submit', {bubbles: true}));
    e.preventDefault();
    return false;
  }
});
