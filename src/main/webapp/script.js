document.getElementById("roleSelect").addEventListener("change", function() {
    var clubSelectWrapper = document.getElementById("clubSelectWrapper");
    if (this.value === "student") {
        clubSelectWrapper.style.display = "block";
    } else {
        clubSelectWrapper.style.display = "none";
    }
});
