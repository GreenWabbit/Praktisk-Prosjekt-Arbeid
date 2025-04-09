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
  
  // FILL IN THE BLANK
  {
    type: "fill",
    question: "Fill in the blanks to create an energy-efficient string builder function using arrays and join():",
    codeWithBlanks: `function buildEfficientString(n) {
  const parts = [];
  for (let i = 0; i < n; i++) {
    // Add the current number to the array
    /* FILL CODE HERE */
  }
  // Join the array elements into a string
  return /* FILL CODE HERE */;
}`,
    solution: `function buildEfficientString(n) {
  const parts = [];
  for (let i = 0; i < n; i++) {
    // Add the current number to the array
    parts.push(i);
  }
  // Join the array elements into a string
  return parts.join('');
}`,
    functionName: "buildEfficientString",
    testCases: [
      { input: 3, expected: "012" },
      { input: 5, expected: "01234" }
    ],
    explanationCorrect: "✔️ Great job! Using arrays with push() and join() is more efficient than string concatenation with +=.",
    explanationWrong: "❌ Using arrays with push() and join() is more memory-efficient than string concatenation in loops."
  },
  {
    type: "fill",
    question: "Complete the lazy-loading image component to make it more eco-friendly:",
    codeWithBlanks: `function createEcoImage(src, alt) {
  const img = document.createElement('img');
  img.src = src;
  img.alt = alt;
  
  // Add attributes for eco-friendly loading
  img.loading = /* FILL CODE HERE */;
  
  // Use modern image format if available
  if (src.endsWith('.jpg') || src.endsWith('.png')) {
    img.src = src.replace(/\\.(jpg|png)$/, /* FILL CODE HERE */);
  }
  
  return img;
}`,
    solution: `function createEcoImage(src, alt) {
  const img = document.createElement('img');
  img.src = src;
  img.alt = alt;
  
  // Add attributes for eco-friendly loading
  img.loading = 'lazy';
  
  // Use modern image format if available
  if (src.endsWith('.jpg') || src.endsWith('.png')) {
    img.src = src.replace(/\\.(jpg|png)$/, '.webp');
  }
  
  return img;
}`,
    functionName: "createEcoImage",
    testCases: [
      { input: ["photo.jpg", "A photo"], expected: { loading: "lazy", src: "photo.webp" } },
      { input: ["icon.png", "An icon"], expected: { loading: "lazy", src: "icon.webp" } }
    ],
    explanationCorrect: "✔️ Excellent! Using lazy loading and WebP format significantly reduces bandwidth and energy usage.",
    explanationWrong: "❌ The solution should use 'lazy' loading and convert images to '.webp' format for better efficiency."
  },

  // CODE CHALLENGE
  {
    type: "code",
    question: "Write a function `double(x)` that returns x * 2.",
    starterCode: `function double(x) {
  // your code here
}`,
    functionName: "double",
    testCases: [
      { input: 2, expected: 4 },
      { input: 10, expected: 20 },
      { input: 0, expected: 0 }
    ],
    explanationCorrect: "✔️ Great job! Your function works efficiently with basic logic.",
    explanationWrong: "❌ Check your logic — the return value doesn't match the expected output."
  },
  {
    type: "code",
    question: "Write a greener version of string concatenation using `.join()`.",
    starterCode: `function buildString(n) {
  // build a string of numbers from 0 to n-1
}`,
    functionName: "buildString",
    testCases: [
      { input: 3, expected: "012" },
      { input: 5, expected: "01234" }
    ],
    explanationCorrect: "✔️ Using `.push()` and `.join()` is much more memory-efficient for building strings.",
    explanationWrong: "❌ Avoid using += inside loops for strings. Use arrays and `.join()` instead."
  }
];

// You'll also need to add code to handle the "fill" type in your loadQuestion function:

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
  } else if (q.type === "code" || q.type === "fill") {
    inputArea.style.display = "block";
    codeA.style.display = "block";
    codeA.textContent = q.type === "fill" ? q.codeWithBlanks : q.starterCode;
    document.getElementById("userCode").value = q.type === "fill" ? q.codeWithBlanks : q.starterCode;
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
  const userCode = document.getElementById("userCode").value;
  const resultsDiv = document.getElementById("testResults");
  resultsDiv.innerHTML = "";
  let passedAll = true;

  try {
    const testFunc = new Function(`${userCode}; return ${q.functionName};`)();

    q.testCases.forEach(({ input, expected }, idx) => {
      let result;
      try {
        const inputVal = typeof input === "object" ? JSON.parse(JSON.stringify(input)) : input;
        result = testFunc(inputVal);
        const passed = JSON.stringify(result) === JSON.stringify(expected);
        if (!passed) passedAll = false;
        const color = passed ? "#00d99f" : "#f44336";
        resultsDiv.innerHTML += `<div style="color: ${color};">Test ${idx + 1}: ${q.functionName}(${JSON.stringify(input)}) → ${passed ? "✅" : `❌ (Expected ${JSON.stringify(expected)}, got ${JSON.stringify(result)})`}</div>`;
      } catch (err) {
        resultsDiv.innerHTML += `<div style="color: red;">Test ${idx + 1} Error: ${err.message}</div>`;
        passedAll = false;
      }
    });

    if (passedAll) {
      correctAnswers++;
      showExplanation(q.explanationCorrect);
      document.getElementById("nextBtn").disabled = false;
    } else {
      showExplanation(q.explanationWrong);
    }
  } catch (err) {
    resultsDiv.innerHTML = `<p style="color:red;">❌ Code Error: ${err.message}</p>`;
    showExplanation("Your code has a syntax or runtime error. Please fix it.");
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

  // 🎉 Confetti!
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
