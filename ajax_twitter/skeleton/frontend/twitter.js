const followToggle = require("./follow_toggle.js");


$(() => {
  const buttons = [];

  $("button.follow-toggle").each((idx, button)=>{
    buttons.push(new followToggle(button));
  });


});
