const questions = [
  // MULTIPLE CHOICE
  {
    type: "multiple",
    question: "Which code is more eco-friendly?",
    codeA: `// Option A
for (let i = 0; i < arr.length; i++) {
  console.log(arr[i]);
}`,
    codeB: `// Option B
arr.forEach(item => console.log(item));`,
    answer: "A",
    explanationCorrect: "✔️ Option A avoids callback overhead and performs better in tight loops.",
    explanationWrong: "❌ Option B adds function call overhead due to the callback, which may be less efficient."
  },
  {
    type: "multiple",
    question: "Which image handling is greener?",
    codeA: `<img src="highres.jpg" />`,
    codeB: `<img src="image.webp" loading="lazy" />`,
    answer: "B",
    explanationCorrect: "✔️ WebP format is lighter and lazy loading reduces bandwidth usage and energy consumption.",
    explanationWrong: "❌ JPEG is heavier and without lazy loading it wastes resources loading offscreen content."
  },
  {
    type: "multiple",
    question: "Which method consumes less energy?",
    codeA: `function isEven(n) {
  return n % 2 === 0;
}`,
    codeB: `function isEven(n) {
  return [0,2,4,6,8].includes(n % 10);
}`,
    answer: "A",
    explanationCorrect: "✔️ Using modulus is faster and uses fewer operations than array lookups.",
    explanationWrong: "❌ The array lookup is heavier and less efficient for such a simple check."
  },

  // FILL-IN-THE-BLANK
  {
    type: "code",
    question: "Fill in the blank to create an efficient link tag that preloads critical CSS:",
    starterCode: `<link rel="________" href="styles.css" as="style" />`,
    blankWord: "preload",
    explanationCorrect: "✔️ Great! Using 'preload' for critical CSS improves page loading performance and reduces energy usage.",
    explanationWrong: "❌ Try again. The correct answer is 'preload' - it helps optimize loading sequence for critical resources."
  },
  {
    type: "code",
    question: "Complete this HTML tag to create an image that loads only when scrolled into view:",
    starterCode: `<img src="eco-image.webp" ________="lazy" alt="Green coding" />`,
    blankWord: "loading",
    explanationCorrect: "✔️ Correct! The 'loading' attribute with 'lazy' value prevents images from loading until they're needed.",
    explanationWrong: "❌ Not quite. Use 'loading' attribute to enable lazy loading of images for better page efficiency."
  },
  {
    type: "code",
    question: "Fill in the blank to reduce power consumption by minimizing DOM updates:",
    starterCode: `const fragment = document.________();
// Add multiple elements to fragment
// ...
document.body.appendChild(fragment);`,
    blankWord: "createDocumentFragment",
    explanationCorrect: "✔️ Excellent! DocumentFragments allow you to construct DOM subtrees and insert them all at once, reducing reflows.",
    explanationWrong: "❌ The correct answer is 'createDocumentFragment()'. This method lets you make multiple DOM changes efficiently."
  }
];

let currentQuestion = 0;
let correctAnswers = 0;

function loadQuestion() {
  const q = questions[currentQuestion];
  document.getElementById("explanation").style.display = "none";
  document.getElementById("explanation").textContent = "";
  document.getElementById("nextBtn").disabled = true;
  document.getElementById("questionText").textContent = q.question;

  // UI elements
  const options = document.getElementById("options");
  const codeA = document.getElementById("codeA");
  const codeB = document.getElementById("codeB");
  const inputArea = document.getElementById("inputArea");
  const testResults = document.getElementById("testResults");

  options.innerHTML = "";
  codeA.style.display = "none";
  codeB.style.display = "none";
  inputArea.style.display = "none";
  testResults.innerHTML = "";

  if (q.type === "multiple") {
    codeA.style.display = "block";
    codeB.style.display = "block";
    codeA.textContent = q.codeA;
    codeB.textContent = q.codeB;

    options.innerHTML = `
      <button onclick="selectAnswer('A')">Option A</button>
      <button onclick="selectAnswer('B')">Option B</button>
    `;
  } else if (q.type === "code") {
    // Create an interactive code block with an input field
    const codeWithInput = q.starterCode.replace("________", 
      '<span class="code-input-wrapper"><input type="text" class="code-input" id="codeInput"></span>');
    
    codeA.style.display = "block";
    codeA.innerHTML = codeWithInput; // Using innerHTML to render the HTML input

    // Show the check button
    inputArea.style.display = "block";
    document.getElementById("userCode").style.display = "none"; // Hide the textarea
    
    // Focus on the input field
    setTimeout(() => {
      const inputField = document.getElementById("codeInput");
      if (inputField) inputField.focus();
    }, 100);
  }
}

function selectAnswer(choice) {
  const q = questions[currentQuestion];
  const isCorrect = choice === q.answer;
  const buttons = document.querySelectorAll("#options button");

  buttons.forEach(btn => {
    btn.disabled = true;
    if (btn.textContent.includes(q.answer)) btn.classList.add("correct");
    else if (btn.textContent.includes(choice)) btn.classList.add("wrong");
  });

  if (isCorrect) {
    correctAnswers++;
    showExplanation(q.explanationCorrect);
  } else {
    showExplanation(q.explanationWrong);
  }
}

function checkInputAnswer() {
  const q = questions[currentQuestion];
  const userInput = document.getElementById("codeInput").value.trim();
  const resultsDiv = document.getElementById("testResults");
  resultsDiv.innerHTML = "";
  
  const isCorrect = userInput === q.blankWord;
  
  if (isCorrect) {
    correctAnswers++;
    showExplanation(q.explanationCorrect);
    document.getElementById("nextBtn").disabled = false;
    resultsDiv.innerHTML = `<div style="color: #00d99f;">Test: ✅ Correct!</div>`;
  } else {
    showExplanation(q.explanationWrong);
    resultsDiv.innerHTML = `<div style="color: #f44336;">Test: ❌ (Expected "${q.blankWord}", got "${userInput}")</div>`;
  }
}

function showExplanation(text) {
  const box = document.getElementById("explanation");
  box.textContent = text;
  box.style.display = "block";
  document.getElementById("nextBtn").disabled = false;
}

function nextQuestion() {
  currentQuestion++;
  updateProgressCircle();

  if (currentQuestion < questions.length) {
    loadQuestion();
  } else {
    showResults();
  }
}

function updateProgressCircle() {
  const percent = (currentQuestion / questions.length) * 100;
  const circle = document.querySelector('.progress-ring__circle');
  const text = document.getElementById('progressPercent');
  const radius = 50;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (percent / 100) * circumference;

  circle.style.strokeDashoffset = offset;
  text.textContent = Math.round(percent) + "%";

  circle.style.transition = "none";
  circle.style.transform = "scale(1.05)";
  setTimeout(() => {
    circle.style.transition = "transform 0.3s ease";
    circle.style.transform = "scale(1)";
  }, 50);
}

function showResults() {
  // Hide question UI
  document.getElementById("questionBox").style.display = "none";
  document.getElementById("nextBtn").style.display = "none";
  document.getElementById("explanation").style.display = "none";
  document.getElementById("checkBtn").style.display = "none";
  document.getElementById("inputArea").style.display = "none";

  // Show result screen only after last question
  const resultScreen = document.getElementById("resultScreen");
  if (resultScreen) {
    resultScreen.classList.remove("hidden");
  }

  const scorePercent = Math.round((correctAnswers / questions.length) * 100);
  document.getElementById("scoreText").textContent = `You got ${correctAnswers}/${questions.length} correct (${scorePercent}%)`;

  // Confetti
  confetti({
    particleCount: 150,
    spread: 100,
    origin: { y: 0.5 }
  });
}

// Theme toggle
document.getElementById("themeToggle").onclick = () => {
  document.body.classList.toggle("dark");
};

// Init
window.onload = () => {
  // All this goes inside
  updateProgressCircle();
  loadQuestion();

  const toggle = document.getElementById("themeToggle");
  toggle.onclick = () => {
    document.body.classList.toggle("dark");

    // Optionally change emoji/icon:
    toggle.textContent = document.body.classList.contains("dark") ? "☀️" : "🌓";
  };
};
