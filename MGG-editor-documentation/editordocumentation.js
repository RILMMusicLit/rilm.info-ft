$(window).on('load', function()
{

    $(".toc").append("<nav role='navigation'>" +
        "<ul class='toc-nav'></ul>");

    var tocNav = $(".toc-nav");
    var content = document.querySelector('.content');

    for(var idx = 0; idx < content.children.length; idx++)
    {
        var curEl = content.children[idx];
        if (!curEl.tagName.match(/h[2-5]/ig)) continue;
        var indentLevel = curEl.tagName.split(/h/ig)[1] - 1;
        tocNav.append("<li data-level='" + indentLevel + "' class='indent indent-level-" + indentLevel + "'>" +
                "<a href='#" + curEl.getAttribute('id') + "'>" + curEl.textContent + "</a>" +
            "</li>");
    }

    var indenteds = document.querySelectorAll('.indent');
    for(var idx = 0; idx < indenteds.length; idx++)
    {
        var thisObj = indenteds[idx];
        if(!thisObj.nextSibling) continue;
        var thisLevel = parseInt(thisObj.getAttribute('data-level'));
        var nextLevel = parseInt(thisObj.nextSibling.getAttribute('data-level'));
        
        if(thisLevel + 1 === nextLevel)
        {
            $(thisObj).prepend("<img src='images/triangle-down.png'/>");
            $(thisObj).addClass('collapsible');
        }
    }

    applyEventListeners();
    $(".indent-level-2 img").trigger('click');
});

function applyEventListeners()
{
$('img').off('click');
    $(".collapsible img").on('click', function(e){
        var activeLI = e.target.parentNode;
        var initLevel = parseInt(e.target.parentNode.getAttribute('data-level'));
        var sib = activeLI.nextSibling;
        var sibLevel = parseInt(sib.getAttribute('data-level'));

        while(sibLevel > initLevel)
        {
            sib.style.display = 'none';
            sib = sib.nextSibling;
            if (!sib) break;
            sibLevel = parseInt(sib.getAttribute('data-level'));
        }

        $(activeLI).addClass('collapsed');
        $(activeLI).removeClass('collapsible');
        e.target.src = 'images/triangle-right.png';
    
        applyEventListeners();
    });

    $(".collapsed img").on('click', function(e){
        var activeLI = e.target.parentNode;
        var initLevel = e.target.parentNode.getAttribute('data-level');
        var sib = activeLI.nextSibling;
        var sibLevel = sib.getAttribute('data-level');

        while(sibLevel > initLevel)
        {
            sib.style.display = 'block';
            sib = sib.nextSibling
            if (!sib) break;
            sibLevel = sib.getAttribute('data-level');
        }
        
        $(activeLI).addClass('collapsible');
        $(activeLI).removeClass('collapsed');
        e.target.src = 'images/triangle-down.png';

        applyEventListeners();
    });
}
$(window).on('load', function() 
{$(".optional").prepend("<p>Authors are not required to use the following tags:</p>");
    
});