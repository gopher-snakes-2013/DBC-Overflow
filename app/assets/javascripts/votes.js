var voteHandler = {

  tallyVotes: function(e, data) {
    console.log($(this).children('.tally'))
    $(this).children('.tally').html(data.tally)
  }


}

$(document).ready(function(){
  $('.cast_vote').on('ajax:success', voteHandler.tallyVotes);
});