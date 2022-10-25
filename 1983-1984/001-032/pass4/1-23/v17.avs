LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v17 = LSMASHVideoSource(dst_dir + "v17f.mp4")
vf = LSMASHVideoSource(dst_dir + "v17f.mp4")
v17 = ImageSource(file = dst_dir + "png\v17\v17-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v17 = v17.autolevels#(gamma=0.7)

v17 = v17.convertToY.adjustSize

v17 = v17.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v17 = v17.convertBits(8).convertToYV12(interlaced=false)

v17 = v17.deScratch.extractY
v17 = v17.removeDirt

v17 = v17.convertToYV12(interlaced=false)

v17 = v17.UnsharpMask(strength=400, radius=5, threshold=1)
v17 = v17.adjustBorders

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

return v17.Prefetch

