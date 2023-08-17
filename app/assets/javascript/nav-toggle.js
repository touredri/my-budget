document.addEventListener('turbo:load', function () {
    const hamburger = document.getElementById('hamburger');
    const tt = document.getElementsByClassName('hamburger');
    const navPop = document.querySelector('.nav-pop');
    const closeIcon = navPop.querySelector('.close');

    hamburger.addEventListener('click', function () {
        console.log(5);
        navPop.classList.remove('hidden');
        navPop.classList.add('flex');
    });

    tt.addEventListener('click', function () {
        console.log(5);
        //navPop.classList.remove('hidden');
       // navPop.classList.add('flex');
    });

    closeIcon.addEventListener('click', function () {
        navPop.classList.add('hidden');
    });
});
