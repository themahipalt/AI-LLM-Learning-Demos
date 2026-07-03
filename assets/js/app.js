async function loadDemos() {
    const demoGrid = document.getElementById("demoGrid");
    const demoFrame = document.getElementById("demoFrame");
  
    try {
      const response = await fetch("assets/data/demos.json");
  
      if (!response.ok) {
        throw new Error("Unable to load demos.json");
      }
  
      const demos = await response.json();
  
      demoGrid.innerHTML = "";
  
      demos.forEach((demo) => {
        const card = document.createElement("div");
        card.className = "demo-card";
  
        card.innerHTML = `
          <div class="demo-number">${demo.id}</div>
          <h3>${demo.title}</h3>
          <p>${demo.description}</p>
  
          <div class="demo-meta">
            <span>${demo.status}</span>
            <span>${demo.level}</span>
          </div>
  
          <div class="demo-actions">
            <button type="button" class="open-demo-btn">Open Demo</button>
            <a href="${demo.path}" target="_blank">Open Full Page</a>
          </div>
        `;
  
        const openButton = card.querySelector(".open-demo-btn");
  
        openButton.addEventListener("click", () => {
          demoFrame.src = demo.path;
          demoFrame.scrollIntoView({ behavior: "smooth" });
        });
  
        demoGrid.appendChild(card);
      });
  
      const firstReadyDemo = demos.find((demo) => demo.status !== "Pending");
  
      if (firstReadyDemo) {
        demoFrame.src = firstReadyDemo.path;
      }
    } catch (error) {
      demoGrid.innerHTML = `
        <div class="demo-card">
          <h3>Could not load demos</h3>
          <p>
            Please run this project using VS Code Live Server.
            Direct file opening may block loading demos.json.
          </p>
        </div>
      `;
  
      console.error(error);
    }
  }
  
  loadDemos();