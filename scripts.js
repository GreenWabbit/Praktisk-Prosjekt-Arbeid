// Data for challenges and certifications
const challenges = [
    { title: "Build a To-Do App", description: "Create a simple To-Do application using HTML, CSS, and JavaScript.", link: "todo-app.html" },
    { title: "Weather App", description: "Build a weather app that fetches data from an API." },
    { title: "Calculator", description: "Create a basic calculator with JavaScript." }
];

// Function to dynamically add challenges to the page
function loadChallenges() {
    const challengesList = document.getElementById("challenges-list");
    challenges.forEach(challenge => {
        const li = document.createElement("li");
        li.innerHTML = `
            <h3>${challenge.title}</h3>
            <p>${challenge.description}</p>
            ${challenge.link ? `<a href="${challenge.link}" class="challenge-link">Start Challenge</a>` : `<button onclick="startChallenge('${challenge.title}')">Start Challenge</button>`}
        `;
        challengesList.appendChild(li);
    });
}

// Function to handle starting a challenge without a link
function startChallenge(title) {
    alert(`Starting challenge: ${title}`);
}

// Load challenges when the page loads
document.addEventListener("DOMContentLoaded", () => {
    loadChallenges();
});

<ul id="challenges-list">
    <li>
        <h3>Build a To-Do App</h3>
        <p>Create a simple To-Do application using HTML, CSS, and JavaScript.</p>
        <a href="todo-app.html" class="challenge-link">Start Challenge</a>
    </li>
    <li>
        <h3>Weather App</h3>
        <p>Build a weather app that fetches data from an API.</p>
        <button onclick="startChallenge('Weather App')">Start Challenge</button>
    </li>
    <li>
        <h3>Calculator</h3>
        <p>Create a basic calculator with JavaScript.</p>
        <button onclick="startChallenge('Calculator')">Start Challenge</button>
    </li>
</ul>