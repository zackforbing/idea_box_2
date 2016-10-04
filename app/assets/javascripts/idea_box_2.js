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
  .fail(handleError)
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

function handleError(error) {
  console.log(error);
};

function createIdea() {
  $("#create-idea").on("click", function() {
    var ideaParams = {
      idea: {
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
      }
    }
    $.post(
      "api/v1/ideas",
      ideaParams
    )
    .then(createIdeaHTML)
    .then(renderIdea)
    .fail(handleError)
  })
};
