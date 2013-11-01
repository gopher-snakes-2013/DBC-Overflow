var commentHandler = {

  toggleForm: function() {
    var $newCommentForm = $(this).parent().find('form')
    if ($newCommentForm.attr("class") == "hidden"){
      $newCommentForm.slideDown("slow");
      $newCommentForm.attr('class', 'shown')
    } else {
      $newCommentForm.slideUp("slow");
      $newCommentForm.attr('class', 'hidden')
    }
  },

  appendComment: function(e, data) {
    $("#comment_content").val("");
    $("#comment-list-"+ data.submission_id).append(data.comment_content+"<br/>");
    $(".add_comment form").slideUp("slow");
    $(":input[name='comment[content]']").val("");
    $(".add_comment form").attr('class', 'hidden');
  }
}

$(document).ready(function() {
  $(".new-comment").on('ajax:success', commentHandler.toggleForm);
  $(".add_comment form").on('ajax:success', commentHandler.appendComment);
});

