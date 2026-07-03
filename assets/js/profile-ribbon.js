(function createProfileRibbon() {
  if (document.getElementById("profileRibbon")) return;

  const ribbon = document.createElement("div");
  ribbon.id = "profileRibbon";
  ribbon.className = "profile-ribbon expanded";

  const photoPath = "assets/images/deepak-gupta.jpg";

  ribbon.innerHTML = `
    <button id="profileRibbonToggle" class="profile-ribbon-tab" title="Open profile">
      DG
    </button>

    <div class="profile-ribbon-content">
      <div class="profile-ribbon-role-badge">
        EXECUTIVE CORPORATE TRAINER • MENTOR • CONSULTANT
      </div>

      <div class="profile-ribbon-main">
        <div class="profile-photo-panel">
          <img src="${photoPath}" alt="Deepak Gupta" class="profile-photo" />
        </div>

        <div class="profile-text-panel">
          <div class="profile-name">Deepak Gupta</div>

          <div class="profile-headline">
            AI, GenAI, Agentic AI, .NET, Azure & Enterprise Technology Enablement
          </div>

          <div class="profile-skill-line">
            AI • GenAI • Agentic AI • .NET • Azure • Integration • Retail IT • Data & BI
          </div>

          <div class="profile-mini-card">
            <strong>20+ Years</strong> • Enterprise AI & .NET Enablement<br>
            Bangalore, India • Corporate Training • Consulting
          </div>

          <div class="profile-links">
            <a href="https://deepakrnpgupta.github.io/profile/" target="_blank">Profile</a>
            <a href="https://www.linkedin.com/in/deepakida/" target="_blank">LinkedIn</a>
            <a href="https://github.com/deepakrnpgupta" target="_blank">GitHub</a>
          </div>
        </div>
      </div>
    </div>
  `;

  document.body.appendChild(ribbon);

  const toggle = document.getElementById("profileRibbonToggle");

  window.addEventListener("load", () => {
    ribbon.classList.add("expanded");

    setTimeout(() => {
      ribbon.classList.remove("expanded");
    }, 4000);
  });

  toggle.addEventListener("click", () => {
    ribbon.classList.toggle("expanded");
  });
})();