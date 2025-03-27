const totalQuestions = 10; // Total number of questions
let currentQuestion = 0;

function nextQuestion() {
  if (currentQuestion < totalQuestions) {
    currentQuestion++;
    updateProgressBar();
  } else {
    alert("Challenge Completed!");
  }
}

function updateProgressBar() {
  const progress = (currentQuestion / totalQuestions) * 100;
  const progressBar = document.getElementById('progressBar');
  progressBar.style.width = progress + '%';
  progressBar.textContent = Math.round(progress) + '%';
}