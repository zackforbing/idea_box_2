$(document).ready(function() {

  fetchIdeas();
  fetchIdeasButton();
  createIdea();
  deleteIdea();

});

function fetchIdeas() {
  $.ajax({
    url: "/api/v1/ideas",
    type: "get"
  }).then(collectIdeas)
  .then(renderIdeas)
  .fail(handleError)
};

function stringTruncate(string, length) {
  if (string.length > length) {
    return string.substr(0, string.lastIndexOf(' ', length)) + " ...";
  } else {
    return string;
  }
};

function collectIdeas(ideasData) {
  return ideasData.map(createIdeaHTML);
};

function createIdeaHTML(idea) {
  return $("<div class='idea' data-id='"
  + idea.id
  + "'><h3 class='editable-title' contenteditable='true'>"
  + stringTruncate(idea.title, 50)
  + "</h3><h6>"
  + idea.quality
  + "</h6><p class='editable-body' contenteditable='true'>"
  + stringTruncate(idea.body, 100)
  + "</p>"
  + "<button id='delete-idea' name='button-fetch' class='btn btn-default btn-xs'>Delete Idea</button>"
  + "</div>")
};

function updateIdea() {
  $(".editable-title", ".editable-body").on("blur", function() {
      var ideaParams = {
        title: $(this).parent().find(".editable-title").val(),
        body: $(this).parent().find(".editable-body").val()
    };
    $.put(
      "api/v1/ideas",
      ideaParams
    )
    .fail(handleError)
  })
};

function renderIdeas(ideasData) {
  $("#all-ideas").html(ideasData);
};

function renderIdea(ideaData) {
  $("#all-ideas").prepend(ideaData);
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
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
    };
    clearTextFields();
    $.post(
      "api/v1/ideas",
      ideaParams
    )
    .then(createIdeaHTML)
    .then(renderIdea)
    .fail(handleError)
  })
};

function clearTextFields() {
  $("#idea-title").val('');
  $("#idea-body").val('');
};

function deleteIdea() {
  $("#all-ideas").on("click", "#delete-idea", function() {
    var $idea = $(this).closest(".idea")
    $.ajax( {
      url: "api/v1/ideas/" + $idea.data("id"),
      type: "delete"
    }).then(function() {
      $idea.remove()
    }).fail(handleError)
  })
}
