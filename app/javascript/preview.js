window.addEventListener('load', function(){
  document.getElementById('images_btn').addEventListener('change', preview);
});

function preview(e){
  const imageFile = e.target.files[0];
  const imagePreviewed = document.getElementById('imagePreviewed')
  if (!imageFile){
    imagePreviewed.removeAttribute('src');
    return null;
  }

  const imageBlob = window.URL.createObjectURL(imageFile);
  if (imagePreviewed) {
    imagePreviewed.setAttribute('src', imageBlob);
    return null
  };
  createImageElement(imageBlob)

};

function createImageElement(imageBlob){
  const imagesList = document.getElementById('images_list')
  const imageElement = document.createElement('div');
  const imageBlobElement = document.createElement('img');
  imageBlobElement.setAttribute('src', imageBlob);
  imageBlobElement.setAttribute('style', 'width:100%');
  imageBlobElement.setAttribute('id', 'imagePreviewed')
  imagesList.appendChild(imageElement);
  imageElement.appendChild(imageBlobElement);
};