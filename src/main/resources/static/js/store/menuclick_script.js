      const mainMenuList = document.querySelector('.topmenubar');
      const detailMenus = document.querySelectorAll('.detailmenu');
      const prohibitedIcons = document.querySelectorAll('.prohibited-icon');

      let isClicked = false;
      let startX = 0;
      let scrollLeft = 0;

      mainMenuList.addEventListener('mousedown', (e) => {
         isClicked = true;
         startX = e.pageX - mainMenuList.offsetLeft;
         scrollLeft = mainMenuList.scrollLeft;
      });

      mainMenuList.addEventListener('mouseleave', () => {
         isClicked = false;
      });

      mainMenuList.addEventListener('mouseup', () => {
         isClicked = false;
      });

      mainMenuList.addEventListener('mousemove', (e) => {
         if (!isClicked) return;
         e.preventDefault();
         const x = e.pageX - mainMenuList.offsetLeft;
         const walk = (x - startX) * 3;
         mainMenuList.scrollLeft = scrollLeft - walk;
      });

      detailMenus.forEach((menu) => {
         menu.addEventListener('click', (e) => {
            e.stopPropagation();
            const prohibitedIcon = menu.querySelector('.prohibited-icon');
            prohibitedIcon.style.display = 'block';
         });
      });