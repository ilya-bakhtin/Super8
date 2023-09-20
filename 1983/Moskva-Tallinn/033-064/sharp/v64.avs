import("..\1983-Moskva-Tallinn.avs")
v64 = LSMASHVideoSource(dst_dir + "v64rc.mp4")

v64 = v64.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v64 = v64.convertToYV12(interlaced=false)

v64 = v64.deScratch
v64 = v64.removeDirt

v64 = v64.UnsharpMask(strength=500, radius=5, threshold=1)
v64 = v64.adjustBorders

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

return v64.Prefetch

