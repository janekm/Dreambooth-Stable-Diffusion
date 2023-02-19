import os
from PIL import Image
from clip_interrogator import Config, Interrogator

ci = Interrogator(Config(clip_model_name="ViT-L-14/openai"))

directory = os.getcwd() # Get current directory
for filename in os.listdir(directory):
    if filename.endswith('.jpg') or filename.endswith('.png'):
        image_path = os.path.join(directory, filename)
        image = Image.open(image_path).convert('RGB')
        output = ci.interrogate(image)
        
        # Save output to .txt file with same base name as image
        base_name = os.path.splitext(filename)[0]
        txt_file = base_name + '.txt'
        with open(txt_file, 'w') as f:
            f.write(output)