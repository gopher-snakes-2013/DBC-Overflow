// not crazy about the name *Hanlder
var CommentHandler = {

  toggleForm: function() {
    var $newCommentForm = $(this).parent().find('form')
    if ($newCommentForm.hasClass?('hidden')){
      $newCommentForm.slideDown("slow");
      $newCommentForm.attr('class', 'shown')
    } else {
      $newCommentForm.slideUp("slow");
      $newCommentForm.addClass('hidden')
    }
  },

  appendComment: function(e, data) {
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

