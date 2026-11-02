fetch("home.php")
    .then(function (response) {
        return response.json();
    })
    .then(function (data) {
        
        document.getElementById("students").innerHTML = data.students;
        document.getElementById("materials").innerHTML = data.materials;
        document.getElementById("answered").innerHTML = data.answered;
        document.getElementById("groups").innerHTML = data.groups;

        
        var html = "";
        for (var i = 0; i < data.subjects.length; i++) {
            var s = data.subjects[i];
            html += "<div class='box subject'>";
            html += "<span class='code'>" + s.code + "</span>";
            html += "<h4>" + s.name + "</h4>";
            html += "<small>" + s.resources + " resources · " + s.questions + " questions</small>";
            html += "</div>";
        }
        document.getElementById("subjectList").innerHTML = html;
    })
    .catch(function () {
        document.getElementById("subjectList").innerHTML = "Could not load data. Is XAMPP running?";
    });

var form = document.getElementById("heroSearch");
var input = document.getElementById("heroInput");

form.onsubmit = function () {
    if (input.value.trim() == "") {
        alert("Please type something to search");
        return false;
    }
    return true;
};


var topics = document.getElementsByClassName("pop");
for (var j = 0; j < topics.length; j++) {
    topics[j].onclick = function (e) {
        e.preventDefault();
        input.value = this.innerHTML;
        form.submit();
    };
}
