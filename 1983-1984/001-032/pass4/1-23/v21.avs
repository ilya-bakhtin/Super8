LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v21 = LSMASHVideoSource(dst_dir + "v21f.mp4")
vf = LSMASHVideoSource(dst_dir + "v21f.mp4")
v21 = ImageSource(file = dst_dir + "png\v21\v21-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v21 = v21.autolevels#(gamma=0.7)

v21 = v21.convertToY.adjustSize

v21 = v21.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v21 = v21.convertBits(8).convertToYV12(interlaced=false)

v21 = v21.deScratch.extractY
v21 = v21.removeDirt

v21 = v21.convertToYV12(interlaced=false)

v21 = v21.UnsharpMask(strength=400, radius=5, threshold=1)
v21 = v21.adjustBorders

va = BlankClip(v21, audio_rate = 48000, channels = 2).killVideo
v21 = v21.audioDub(va)

return v21.Prefetch

