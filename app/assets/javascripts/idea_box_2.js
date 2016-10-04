$(document).ready(function() {

  fetchIdeas();
  fetchIdeasButton();

});

function fetchIdeas() {
  $.ajax({
    url: "/api/v1/ideas",
    type: "get"
  }).then(collectIdeas)
  .then(renderIdeas)
};

function collectIdeas(ideasData) {
  return ideasData.map(createIdeaHTML);
};

function createIdeaHTML(idea) {
  return $("<div class='idea' data-id='"
  + idea.id
  + "'><h3>"
  + idea.title
  + "</h3><p>"
  + idea.description
  + "</p>"
  + "<button id='delete-idea' name='button-fetch' class='btn btn-default btn-xs'>Delete Idea</button>"
  + "</div>")
};

function renderIdeas(ideasData) {
  $("#all-ideas").html(ideasData);
};

function renderIdea(ideaData) {
  $("#all-ideas").append(ideaData);
};

function fetchIdeasButton() {
  $("button[name=button-fetch]").on("click", fetchIdeas);
};
