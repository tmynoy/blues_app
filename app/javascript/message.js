function scrollToEnd() {
  const messagesArea = document.getElementById('scroll');
  messagesArea.scrollTop = messagesArea.scrollHeight;
}

window.addEventListener("load", scrollToEnd)
