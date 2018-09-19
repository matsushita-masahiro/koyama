
$(function() {
     
    $('#open1').click(function() {
        $('#modal1').removeClass('hidden');
        $('.mask').removeClass('hidden');
    });
    
    $('#open2').click(function() {
        $('#modal2').removeClass('hidden');
        $('.mask').removeClass('hidden');
    });
    
    $('.close').click(function() {
        $('#modal1').addClass('hidden');
        $('#modal2').addClass('hidden');
        $('.mask').addClass('hidden');
    });
    
    $('.mask').click(function() {
        $('#modal1').addClass('hidden');
        $('#modal2').addClass('hidden');
        $('.mask').addClass('hidden');
    });
    
    
    $('.index-hover').hover(
        function() {
            $(this).find('.text-contents').addClass('text-active');
        },
        function() {
            $(this).find('.text-contents').removeClass('text-active');
        }
    );
});